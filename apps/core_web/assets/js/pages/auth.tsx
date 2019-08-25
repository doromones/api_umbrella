import * as React from 'react';
import {FacebookProvider, LoginButton} from 'react-facebook';

import Main from '../components/Main';

const FACEBOOK_CLIENT_ID = window.CONFIG.FACEBOOK_CLIENT_ID;

export default class AuthPage extends React.Component<{}> {
    public render(): JSX.Element {
        return (
            <Main>
                <h1>Auth</h1>

                <FacebookProvider appId={FACEBOOK_CLIENT_ID}>
                    <LoginButton
                        scope="email"
                        onCompleted={this.handleResponse}
                        onError={this.handleError}
                    >
                        <span>Login via Facebook</span>
                    </LoginButton>
                </FacebookProvider>
            </Main>
        );
    }

    private handleResponse(data) {
        console.log(data);
        console.log(data.tokenDetail.accessToken);
        // const tokenBlob = new Blob([
        //         JSON.stringify({access_token: response.accessToken}, null, 2)
        //     ],
        //     {type: 'application/json'}
        // );
        // const options = {
        //     method: 'POST',
        //     body: tokenBlob,
        //     mode: 'cors',
        //     cache: 'default'
        // };
        // fetch('https://localhost:4000/api/v1/auth/facebook', options).then(r => {
        //     const token = r.headers.get('x-auth-token');
        //     r.json().then(user => {
        //         if (token) {
        //             this.setState({isAuthenticated: true, user, token})
        //         }
        //     });
        // })
    }

    private handleError(error) {
        console.log("handleError", error)
        // this.setState({error});
    }
}
