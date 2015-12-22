package com.tigerbrokers.open.demo;

import android.app.Application;

import com.tigerbrokers.open.account.AccountContext;

/**
 * @author chentian
 */
public class DemoApplication extends Application {

  @Override
  public void onCreate() {
    super.onCreate();
    AccountContext.init(this);
  }

  @Override
  public void onTerminate() {
    super.onTerminate();
    AccountContext.destroy();
  }
}
