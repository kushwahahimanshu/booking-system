<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Seat extends Model
{
    use HasFactory;
    use SoftDeletes;

    public function rows()
    {
        return $this->belongsTo(Row::class); // there is no key to relate we need to user FIRST here
    }
}
