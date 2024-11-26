import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  standalone: false,
  styleUrl: './app.component.scss'
})

export class AppComponent {
  title = 'devops-angular-project';
  stickers: Sticker[]

  constructor() {
    this.stickers = new Array<Sticker>()
  }

  deleteSticker(id: number) {

  }
}
