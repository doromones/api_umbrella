import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  emailControl = new FormControl('', [
    Validators.required,
    Validators.email
  ]);

  passwordControl = new FormControl('', [
    Validators.required
  ]);

  loginForm = new FormGroup({
    emailControl: this.emailControl,
    passwordControl: this.passwordControl
  });

  constructor() {
  }

  ngOnInit() {
  }

}
