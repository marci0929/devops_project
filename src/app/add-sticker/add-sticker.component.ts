import { Component } from '@angular/core';
import { Router } from '@angular/router';
import {FormsModule} from '@angular/forms';

@Component({
  selector: 'app-add-sticker',
  templateUrl: './add-sticker.component.html',
  styleUrls: ['./add-sticker.component.scss'],
  imports: [FormsModule],
})

export class AddStickerComponent {
  title = '';
  text = '';

  constructor(private router: Router) {}

  saveSticker(): void {
    const stickers = JSON.parse(localStorage.getItem('stickers') || '[]');
    stickers.push({ title: this.title, content: this.text });
    localStorage.setItem('stickers', JSON.stringify(stickers));
    this.router.navigate(['/']);
  }

  navigateHome(): void {
    this.router.navigate(['/']);
  }
}
