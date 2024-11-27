import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Sticker } from '../../model/Sticker';
import { Router } from '@angular/router';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.scss'],
  imports: [CommonModule]
})
export class MainComponent {
  stickers: Sticker[] = [];

  constructor(private router: Router) {}

  ngOnInit(): void {
    this.stickers = JSON.parse(localStorage.getItem('stickers') || '[]');
  }

  deleteSticker(index: number): void {
    this.stickers.splice(index, 1);
    localStorage.setItem('stickers', JSON.stringify(this.stickers));
  }

  navigateToAddSticker(): void {
    this.router.navigate(['/add-sticker']);
  }

}
