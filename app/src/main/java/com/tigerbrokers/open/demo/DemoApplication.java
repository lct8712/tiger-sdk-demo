package com.tigerbrokers.open.demo;

import android.app.Application;
import android.content.Context;

import com.tigerbrokers.open.account.AccountContext;

/**
 * @author chentian
 */
public class DemoApplication extends Application {

  @Override
  protected void attachBaseContext(Context base) {
    super.attachBaseContext(base);
  }

  @Override
  public void onCreate() {
    super.onCreate();

    AccountContext.init(this);
  }
}
