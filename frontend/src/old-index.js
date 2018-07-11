import React from 'react';
import ReactDOM from 'react-dom';
import request from 'request-promise';
import { Security, SecureRoute, ImplicitCallback } from '@okta/okta-react';

import LibraryPage from './components/LibraryPage';
import SongsList from './data/SongsList';
import Config from './config';

const config = {
  issuer: 'https://dev-907827.oktapreview.com/oauth2/default',
  redirectUri: window.location.origin + '/implicit/callback',
  clientId: '0oacxa63yjAIrF0br0h7'
}

// Hard-coded list of user-songs, just to prove this out
request({
  uri: `${Config.get('api.url')}/users/2/songs`,
  method: 'get',
  resolveWithFullResponse: true,
})
  .then((response) => {
    const body = JSON.parse(response.body);

    // Of course we wouldnt just get the full list of songs,
    // and pass it into an object contructor like this, but we
    // can optimize that in a future iteration =)
    return ReactDOM.render(
      <LibraryPage songs={new SongsList(body)}/>,
      document.getElementById('root'),
    );
  });
