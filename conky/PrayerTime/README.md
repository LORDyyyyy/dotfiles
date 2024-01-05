# prayer-times-calculator
The program was made by [JAMmIKA1](https://github.com/JAMmIKA1).<br>
You can explore the source code at [JAMmIKA1/prayer-times-calculator](https://github.com/JAMmIKA1/prayer-times-calculator).<br>

Some changes I made:

The ```command``` variable in ```polybar_module.cpp```
```cpp
command = "notify-send -t 300000 \"It's " + prayer_name + " time.\" -i /home/lordy/Programs/PrayerTime/prayer.png -a \"Prayer Time\"";
```

The ```for loop```  in ```main.cpp```
```cpp
for(int i = 0; i < 6; i++)
{
    int hour = prayer[i].time / 60;
    int min = prayer[i].time % 60;
    string name = prayer[i].name.c_str();
    string t;

    t = hour > 12 ? "PM" : "AM";
    hour = hour > 12 ? hour - 12 : hour;

    cout << left << setw(10) << setfill(' ') << name  + ":" << setw(10) << " " << right;
    cout << setw(2) << setfill('0') << hour << ":";
    cout << setw(2) << setfill('0') << min << t << endl;
}
```
