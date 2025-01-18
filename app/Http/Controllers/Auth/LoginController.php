<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\UserSession;
use App\Providers\RouteServiceProvider;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use GuzzleHttp\Client;


class LoginController extends Controller
{
    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    /**
     * Handle the user after successful login.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return mixed
     */
    protected function authenticated(Request $request, $user)
    {
        // Log the user login event
        Log::info("User logged in: {$user->name}");

        // Save session data into the user_sessions table
        UserSession::create([
            'user_id' => $user->id,
            'ip_address' => $request->ip(), // Get the user's IP address
            'mac_address' => $this->getMacAddress(), // Optional: MAC address if needed
            'login_at' => Carbon::now(),
            'last_activity' => Carbon::now(),
            'session_type' => 'web', // Could be 'mobile' or 'api' based on the source of the login
            'user_agent' => $request->header('User-Agent'), // Get the User-Agent string
            'location' => $this->getLocationFromIp($request->ip()), // Optional: Get location based on IP
        ]);

        // Optionally log the login event with all details
        Log::info("User login details saved: IP - {$request->ip()}");

        // Redirect user to the intended page or homepage
        return redirect()->intended($this->redirectTo);
    }

    /**
     * Get the MAC address of the user (optional).
     * This method would return null since accessing the MAC address through HTTP is generally not possible.
     * You may need to implement this method for specific use cases.
     *
     * @return string|null
     */
    protected function getMacAddress()
    {
        // MAC address is not accessible via HTTP requests in a browser.
        // It can only be accessed on a local network, not through standard web requests.
        return null; // Placeholder: return null or implement a different method if applicable
    }

    /**
     * Get the location of the user based on their IP address (optional).
     * You can use an external service for IP geolocation to determine the user's location.
     *
     * @param string $ip
     * @return string|null
     */
    protected function getLocationFromIp($ip)
    {
        $access_token = '09cb2c7a786667'; // Replace with actual token
        $client = new Client();
    
        try {
            $response = $client->get("http://ipinfo.io/{$ip}/json?token={$access_token}");
            $data = json_decode($response->getBody(), true);
    
            // Return location (city, country)
            return isset($data['city']) && isset($data['country']) 
                ? "{$data['city']}, {$data['country']}"
                : 'Unknown Location'; // Fallback if data is not available
        } catch (\Exception $e) {
            // Log the error for debugging purposes
            Log::error("Error fetching location for IP {$ip}: " . $e->getMessage());
    
            // Return a default fallback value
            return 'Unknown Location';
        }
    }
    

    /**
     * Log the user out of the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $user = Auth::user();

        if ($user) {
            // Ensure user is marked as offline
            $user->is_online = false;  // This will set the user's online status to false
            $user->save();  // Save the change to the database
        }

        // Log the user out of the application
        Auth::guard()->logout();

        // Invalidate the session and regenerate the CSRF token for security
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        // Redirect to the home page or login page after logout
        return redirect('/');
    }
}
