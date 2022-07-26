import React from 'react';
import Posts from './Posts';
import { ActionCableProvider } from 'use-action-cable';

//provides access to ActionCable through React Context
//passes down destructured props to Posts component

export default function PostsWrapper(props) {  
  return (    
    <ActionCableProvider url="/cable">
      <Posts {...props} />
    </ActionCableProvider>
  );
}
