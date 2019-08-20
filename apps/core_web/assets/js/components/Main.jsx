// assets/js/components/Main.tsx

import * as React from 'react'
import {Component} from "react";

class Main extends Component {
    render() {
        return (
            <main role="main" className="container">
                {this.props.children}
            </main>
        )
    }
}

export default Main
