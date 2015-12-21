package com.tigerbrokers.open.demo;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.tigerbrokers.open.account.AccountContext;

public class MainActivity extends AppCompatActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    AccountContext.start(this);
  }
}
