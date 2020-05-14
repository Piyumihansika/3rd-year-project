import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';

import {BaseLayoutComponent} from './Layout/base-layout/base-layout.component';
import {PagesLayoutComponent} from './Layout/pages-layout/pages-layout.component';
import {BuyerLayoutComponent} from './Layout/buyer-layout/buyer-layout.component';



// Dashboards

import {AnalyticsComponent} from './DemoPages/Dashboards/analytics/analytics.component';

// User Pages

import {ForgotPasswordBoxedComponent} from './DemoPages/UserPages/forgot-password-boxed/forgot-password-boxed.component';
import {LoginBoxedComponent} from './DemoPages/UserPages/login-boxed/login-boxed.component';
import {RegisterBoxedComponent} from './DemoPages/UserPages/register-boxed/register-boxed.component';

// buyer pages
import { BuyerHomeComponent } from './Buyer/buyer-home/buyer-home.component';
import { CategoriesComponent } from './Buyer/categories/categories.component';
import { NotificationsComponent } from './Buyer/notifications/notifications.component';
import { ProfileComponent } from './Buyer/profile/profile.component';
import { CartComponent } from './Buyer/cart/cart.component';
import { ProductsComponent } from './Buyer/products/products.component';
import { ProgressComponent } from './Buyer/progress/progress.component';


const routes: Routes = [
  {
    path: '',
    component: BaseLayoutComponent,
    children: [

      // Dashboads

      {path: '', component: AnalyticsComponent, data: {extraParameter: 'dashboardsMenu'}},
     
    ]

  },

  {
    path: '',
    component: BuyerLayoutComponent,
    children: [
      //homePage
      {path: 'Buyer/buyerHome', component: BuyerHomeComponent, data: {extraParameter: 'buyerHome'}},
      {path: 'buyer/Categories', component: CategoriesComponent, data: {extraParameter: 'buyerHome'}},
      {path: 'buyer/Profile', component: ProfileComponent, data: {extraParameter: 'buyerHome'}},
      {path: 'buyer/Cart', component: CartComponent, data: {extraParameter: 'buyerHome'}},
      {path: 'buyer/Notification', component: NotificationsComponent, data: {extraParameter: 'buyerHome'}},
      {path: 'buyer/Products', component: ProductsComponent, data: {extraParameter: 'buyerHome'}},
      {path: 'buyer/Progress', component: ProgressComponent, data: {extraParameter: 'buyerHome'}},
    ]
  },
  
  {
    path: '',
    component: PagesLayoutComponent,
    children: [

      // User Pages

      {path: 'pages/login-boxed', component: LoginBoxedComponent, data: {extraParameter: ''}},
      {path: 'pages/register-boxed', component: RegisterBoxedComponent, data: {extraParameter: ''}},
      {path: 'pages/forgot-password-boxed', component: ForgotPasswordBoxedComponent, data: {extraParameter: ''}},
    ]
  },
  {path: '**', redirectTo: ''}
];

@NgModule({
  imports: [RouterModule.forRoot(routes,
    {
      scrollPositionRestoration: 'enabled',
      anchorScrolling: 'enabled',
    })],
  exports: [RouterModule]
})
export class AppRoutingModule {
}









