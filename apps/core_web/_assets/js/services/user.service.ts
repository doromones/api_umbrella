const login = (provider: string, accessToken: string) => {
    const requestOptions = {
        method: 'GET',
        mode: 'cors',
        cache: 'default'
    };
    const domain = "https://api.server.dev";
    const url = `${domain}/auth/${provider}/callback?access_token=${accessToken}`;

    return fetch(`${url}/users/authenticate`, requestOptions)
        .then(handleResponse)
        .then(user => {
            // store user details and jwt token in local storage to keep user logged in between page refreshes
            localStorage.setItem('user', JSON.stringify(user));

            return user;
        });
};

const logout = () => {
    // remove user from local storage to log user out
    localStorage.removeItem('user');
};

const handleResponse = (response) => {
    return response.text().then(text => {
        const data = text && JSON.parse(text);

        if (!response.ok) {
            if (response.status === 401) {
                // auto logout if 401 response returned from api
                logout();
                location.reload(true);
            }

            const error = (data && data.message) || response.statusText;
            return Promise.reject(error);
        }

        data['accessToken'] = reponse.headers.get('Authorization');
        return data;
    });
};

export const userService = {
    login,
    logout
};
