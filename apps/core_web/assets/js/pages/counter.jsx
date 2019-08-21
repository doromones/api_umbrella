import * as React from 'react';
import {BrowserRouter, Link, Route, Switch} from 'react-router-dom';

import Main from '../components/Main';
import {Component} from "react";

const initialState = { currentCount: 0 };

class CounterPage extends Component {
    render() {
        return (
            <Main>
                <h1>Counter</h1>
                <p>
                    The Counter is the simplest example of what you can do with a React
                    component.
                </p>
                <p>
                    Current count: <strong>{this.state.currentCount}</strong>
                </p>
                {/* We apply an onClick event to these buttons to their corresponding functions */}
                <button className="button" onClick={this.incrementCounter}>
                    Increment counter
                </button>{' '}
                <button
                    className="button button-outline"
                    onClick={this.decrementCounter}
                >
                    Decrement counter
                </button>{' '}
                <button className="button button-clear" onClick={this.resetCounter}>
                    Reset counter
                </button>
                <br />
                <br />
                <p>
                    <Link to="/">Back to home</Link>
                </p>
            </Main>
        );
    }

    constructor(props) {
        super(props);

        this.state = initialState;
    }

    incrementCounter = () => {
        this.setState({
            currentCount: this.state.currentCount + 1
        });
    };

    decrementCounter = () => {
        this.setState({
            currentCount: this.state.currentCount - 1
        });
    };

    resetCounter = () => {
        this.setState({
            currentCount: 0
        });
    };
}

export default CounterPage;
