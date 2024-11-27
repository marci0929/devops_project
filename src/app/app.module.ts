import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { FormsModule } from '@angular/forms';
import { MainComponent } from './main/main.component';
import { AddStickerComponent } from './add-sticker/add-sticker.component';
import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent
    ],
    imports: [
        BrowserModule,
        AppRoutingModule,
        AddStickerComponent,
        MainComponent,
        FormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
