<?php

namespace App\Http\Controllers;

use App\Models\Row;
use App\Models\Seat;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    public function bookingPage(Request $request)
    {
        $data['rowdata']=Row::with('seats')->get();
        return view('booking_page',$data);
    }
    public function seatInsertion(Request $request)
    {
        for ($i=1; $i <= 101; $i++) {
            $new = new Seat();
            $new->seat_name='S'.$i;
            $new->save();
        }
        return "Seat insertion done";
    }
    public function rowInsertion(Request $request)
    {
        for ($i=1; $i <= 13; $i++) {
            $new = new Row();
            if ($i<13) {
             $new->available_qty=8;
            }else
            $new->available_qty=5;
            $new->save();
        }
        return "Seat insertion done";
    }
    public function seatUpdate(Request $request)
    {
        $seatCount= 101;
        //$no_of_row=$seatCount/8;
        $seatCount=8;
        $per_row_count=8;
        $row_id=1;
        for ($i=1; $i <= 101; $i++) {
            $new = Seat::find($i);
            if ($i<=$seatCount) {
                $new->row_id=$row_id;
            }elseif ($i>$seatCount) {
                $row_id++;
                $seatCount= $per_row_count*$row_id;
                $new->row_id=$row_id;
            }
            else{
                $new->row_id=$row_id;
            }
            $new->save();
        }


            // if ($i<=8) {
            //     $new->row_id=1;
            // } else if ($i<=14) {
            //     $new->row_id=2;
            // }else if ($i<=21) {
            //     $new->row_id=3;
            // }else if ($i<=28) {
            //     $new->row_id=4;
            // }else if ($i<=35) {
            //     $new->row_id=5;
            // }else if ($i<=42) {
            //     $new->row_id=6;
            // }else if ($i<=49) {
            //     $new->row_id=7;
            // }else if ($i<=56) {
            //     $new->row_id=8;
            // }else if ($i<=63) {
            //     $new->row_id=9;
            // }else if ($i<=70) {
            //     $new->row_id=10;
            // }else if ($i<=77) {
            //     $new->row_id=11;
            // }else{
            //     $new->row_id=12;
            // }
            // $new->save();
        //}
        return "Seat Update done";
    }
    // public function bookSeat(Request $request)
    // {
    //     $seatCount=3;
    //     // $data = DB::table('users')->orderBy('id')->chunk(100, function ($users) {
    //     //         foreach ($users as $user) {
    //     //             //
    //     //         }
    //     //     });
    //       $idarr=[];
    //       Seat::where('booking_status',0)->chunk(7, function($seats) use ($idarr) {
    //             foreach ($seats as $seat) {
    //                 array_push($idarr,$seat->id);
    //                 //dd($seat->seat_name);
    //             }
    //             dd($idarr);
    //         });
    //        // return $data;
    //         return $idarr;
    //     return 'success';
    // }
    public function bookSeat(Request $request)
    {
        try {
                $seatCount=$request->no_of_sheet;
                //check available sheet validation
                $availableSeats=Seat::where('booking_status',0)->count('id');
                if ($seatCount>$availableSeats) {
                    $response = array(
                        'status' => 'error',
                        'msg' => 'Seats Not Available!!',
                    );
                    return response()->json($response);
                }
                //end validation
                $rowRecord=Row::where('available_qty','>=',$seatCount)->where('available_qty','>',0)->orderBy('available_qty','asc')->get();
                if (count($rowRecord)==0) {
                $rowRecord=Row::where('available_qty','<=',$seatCount)->where('available_qty','>',0)->orderBy('available_qty','desc')->get();
                }
                foreach ($rowRecord as $key => $row) {
                    if ($seatCount==0) { //if all sheet book then break code
                        break;
                    }
                    if($row->available_qty==$seatCount){
                        //dd($rowRecord);
                        Seat::where('row_id',$row->id)->where('booking_status',0)->update(['booking_status'=>1]);//status update in seats table
                        $leftsheet=0; //for row table update purpose
                        $seatCount=0;//because all sheet are booked by fulfill condition
                    }else{
                        if ($row->available_qty>$seatCount) {
                            $leftsheet=$row->available_qty-$seatCount;//row qty will be decrease on particular row
                            $seats=Seat::where('row_id',$row->id)->where('booking_status',0)->take($seatCount)->get();//when not equal then again foreach
                            $idarr=[];
                            foreach ($seats as $key => $seat) {
                                //array push
                                array_push($idarr,$seat->id);
                            }
                           $update= Seat::whereIn('id',$idarr)->update(['booking_status'=>1]); //status update in seats table
                            $seatCount=0;//because all sheet are booked by fulfill condition
                        }else{ //continue till sheet not book completed
                            $leftsheet=0; //row qty will be zero on particular row
                            $seatCount=$seatCount-$row->available_qty; //decrease sheet count
                            $seats=Seat::where('row_id',$row->id)->where('booking_status',0)->take($row->available_qty)->get();//take all avl qty of a particular row
                            $idarr=[];
                            foreach ($seats as $key => $seat) {
                                //array push
                                array_push($idarr,$seat->id);
                            }
                            Seat::whereIn('id',$idarr)->update(['booking_status'=>1]); //status update in seats table
                        }
                    }
                    //need to update qty in row table
                    $row->available_qty=$leftsheet;
                    $row->save();
                }
                $response = array(
                    'status' => 'success',
                    'msg' => 'Sheet Booking Successfully',
                );
                return response()->json($response);
        } catch (\Exception $e) {
            $response = array(
                'status' => 'error',
                'msg' => 'Something missing!!',
            );
            return response()->json($response);
        }
    }
}
