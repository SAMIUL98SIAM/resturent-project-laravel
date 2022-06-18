<?php

namespace App\Http\Controllers\Frontend\Blog;
use App\Models\CommentReply;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CommentReplyController extends Controller
{
    public function store(Request $request, $comment)
    {
        $this->validate($request, ['message' => 'required|max:1000']);
        $commentReply = new CommentReply();
        $commentReply->comment_id = $comment;
        $commentReply->user_id = Auth::id();
        $commentReply->message = $request->message;
        $commentReply->save();

        // Success message
        notify()->success('The comment replied successfully.', 'success');
        return redirect()->back();
    }
}
