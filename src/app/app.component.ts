import { Component } from '@angular/core';
import { Sticker } from '../model/Sticker';

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
