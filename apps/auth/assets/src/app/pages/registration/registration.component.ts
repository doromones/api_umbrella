import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from "@angular/forms";

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.scss']
})
export class RegistrationComponent implements OnInit {
  emailControl = new FormControl('', [
    Validators.required,
    Validators.email
  ]);
  passwordControl = new FormControl('', [
    Validators.required
  ]);
  passwordConfirmationControl = new FormControl('', [
    Validators.required
  ]);

  registrationForm = new FormGroup({
    emailControl: this.emailControl,
    passwordControl: this.passwordControl,
    passwordConfirmationControl: this.passwordConfirmationControl,
  }, {
    validators: this.checkFormPasswords
  });

  constructor() {
  }

  ngOnInit() {
  }

  checkFormPasswords(form: FormGroup) {
    let passwordControl = form.controls["passwordControl"];
    let passwordConfirmControl = form.controls['passwordConfirmationControl'];

    if (passwordControl.value === passwordConfirmControl.value) {
      passwordConfirmControl.setErrors(null);
    } else {
      passwordConfirmControl.setErrors({notEqual: true});
    }
    return null;
  }
}
