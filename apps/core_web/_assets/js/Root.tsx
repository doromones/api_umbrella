import * as React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import Header from './components/Header';
import HomePage from './pages';
import CounterPage from './pages/counter';
import FetchDataPage from './pages/fetch-data';
import AuthPage from './pages/auth';

export default class Root extends React.Component<{}> {
    public render(): JSX.Element {
        return (
            <>
                <Header />
                <BrowserRouter>
                    <Switch>
                        <Route exact path="/" component={HomePage} />
                        <Route path="/counter" component={CounterPage} />
                        <Route path="/fetch-data" component={FetchDataPage} />
                        <Route path="/auth" component={AuthPage} />
                    </Switch>
                </BrowserRouter>
            </>
        );
    }
}
