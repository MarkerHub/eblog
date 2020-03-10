package com.example;

public class CountTest {

    // count初始为0
    private long count = 0;

    // count循环1万次加一
    private void add() {
        int i = 0;
        while (i++ < 10000) {
            count += 1;
        }
    }

    public static long calc () throws InterruptedException {
        final CountTest test = new CountTest();

        // 起两个线程分别调用同一个对象的add方法
        Thread thread1 = new Thread(test::add);
        Thread thread2 = new Thread(test::add);

        thread1.start();
        thread2.start();

        thread1.join();
        thread2.join();

        // 待两个线程结束后返回count值
        return test.count;
    }

    public static void main(String[] args) throws InterruptedException {
        long count = CountTest.calc();

        // 调用方法，打印结果
        System.out.println("return-------------->" + count);

        // 感觉上结果应该是2万，为什么不是呢？？？？

    }

}
