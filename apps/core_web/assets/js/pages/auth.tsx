import * as React from 'react';
import FacebookLogin from 'react-facebook-login';

import Main from '../components/Main';

const FACEBOOK_CLIENT_ID = window.CONFIG.FACEBOOK_CLIENT_ID;

export default class AuthPage extends React.Component<{}> {
    public render(): JSX.Element {
        return (
            <Main>
                <h1>Auth</h1>
                <FacebookLogin
                    appId={FACEBOOK_CLIENT_ID}
                    autoLoad={true}
                    fields="name,email,picture"
                    callback={this.responseFacebook}/>
            </Main>
        );
    }

    responseFacebook = (response: any) => {
        console.log(this.props)
        console.log(response)
        // debugger
        // const { dispatch } = this.props;

        // dispatch(userActions.login("facebook", response.accessToken));
        // this.getUserData("facebook", response.accessToken)
    };

    getUserData(provider: string, accessToken: string): void {
        const options = {
            method: 'GET',
            mode: 'cors',
            cache: 'default'
        };
        const domain = "https://api.server.dev";
        const url = `${domain}/auth/${provider}/callback?access_token=${accessToken}`;
        fetch(url, options).then(r => {
            const token = r.headers.get('Authorization');
            console.log(`token: ${token}`)

            options['headers'] = {
                Authorization: token
            };

            // fetch(`${domain}/users`, options)

            // r.json().then(json => {
            //     console.log(json)
            //     // if (token) {
            //     //     this.setState({isAuthenticated: true, user, token})
            //     // }
            // });
        })
    }
}
