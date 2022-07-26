import React, { useState } from 'react';
import PropTypes from 'prop-types';
import { useActionCable } from 'use-action-cable';

const Posts = props => {

  //initial state
  const [posts, setPosts] = useState(props.posts)

  //handler of new data for the ActionCable subscription
  const channelHandlers = {
    received: data => {
      console.log(`[ActionCable] [Posts]`, data);
      //setting Posts function
      setPosts(data);
    }
  };

  //app\channels\posts_channel.rb
  //ties the handler and channel name into a new front-end subscription
  useActionCable({ channel: "PostsChannel" }, channelHandlers);

  return (
    <React.Fragment>
      {posts.map(post => {
        return (
          <div key={post.id} className='card mb-2'>
            <div className='card-body'>
              <h5 className='card-title text-muted'>
                <small className='float-right'>
                  Posted at {post.created_at}
                </small>
                {post.username}
              </h5>
              <div className='card-text lead mb-2'>
                {post.body}
              </div>
              <a className='card0link' href={`/posts/${post.id}/repost`}>
                Repost ({post.repost_count})
              </a>
              <a className='card0link' href={`/posts/${post.id}/like`}>
                Likes ({post.likes_count})
              </a>
            </div>
          </div>
        );
      })}
    </React.Fragment>
  );
};

//used for passing read-only attributes to make sure props are of the correct data type
Posts.PropTypes = {
  posts: PropTypes.array,
  header_display: PropTypes.string
};

export default Posts;