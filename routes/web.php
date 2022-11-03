<?php

use App\Http\Controllers\BookingController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });
 Route::get('/',[BookingController::class,'bookingPage']);
// Route::get('booking-page',[BookingController::class,'bookingPage']);
 Route::get('seat-insertion',[BookingController::class,'seatInsertion']);
 Route::post('book-sheet',[BookingController::class,'bookSeat']);
 Route::get('row-insertion',[BookingController::class,'rowInsertion']);
 Route::get('seats-update',[BookingController::class,'seatUpdate']);
