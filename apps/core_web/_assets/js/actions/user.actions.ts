import {Dispatch} from "react";
import {userConstants} from "../constants/user.constants";
import {userService} from "../services/user.service";

const login = (provider: string, accessToken: string) => {
    return (dispatch) => {
        dispatch(request({ provider }));
    };

    function request(provider) { return { type: userConstants.LOGIN_REQUEST, provider } }

};

const  logout = () => {
    userService.logout();
    return { type: userConstants.LOGOUT };
};

export const userActions = {
    login,
    logout
};
