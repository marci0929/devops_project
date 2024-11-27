import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MainComponent } from './main/main.component';
import { AddStickerComponent } from './add-sticker/add-sticker.component';

const routes: Routes = [
  { path: '', component: MainComponent },
  { path: 'add-sticker', component: AddStickerComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
