package com.etycx.marry.common.utils;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;


public class Permutations<T> implements Iterable<List<T>> {

    PermutationGenerator pGenerator;
    T[] elements;
    int[] indices;

    public Permutations(List<T> list) {
        pGenerator = new PermutationGenerator(list.size());
        elements = (T[]) list.toArray();
    }

    public Iterator<List<T>> iterator() {
        return new Iterator<List<T>>() {

            int pos = 0;

            public boolean hasNext() {
                return pGenerator.hasMore();
            }

            public List<T> next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                indices = pGenerator.getNext();
                List<T> permutation = new ArrayList<T>();
                for (int i = 0; i < indices.length; i++) {
                    permutation.add(elements[indices[i]]);
                }
                return permutation;
            }

            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
    }

    private final class PermutationGenerator {

        private int[] a;
        private BigInteger numLeft;
        private BigInteger total;


        public PermutationGenerator(int n) {
            if (n < 1) {
                throw new IllegalArgumentException("Set must have at least one element");
            }
            a = new int[n];
            total = getFactorial(n);
            reset();
        }


        public void reset() {
            for (int i = 0; i < a.length; i++) {
                a[i] = i;
            }
            numLeft = new BigInteger(total.toString());
        }


        public BigInteger getNumLeft() {
            return numLeft;
        }

        public BigInteger getTotal() {
            return total;
        }

        public boolean hasMore() {
            return numLeft.compareTo(BigInteger.ZERO) == 1;
        }


        private BigInteger getFactorial(int n) {
            BigInteger fact = BigInteger.ONE;
            for (int i = n; i > 1; i--) {
                fact = fact.multiply(new BigInteger(Integer.toString(i)));
            }
            return fact;
        }


        public int[] getNext() {

            if (numLeft.equals(total)) {
                numLeft = numLeft.subtract(BigInteger.ONE);
                return a;
            }

            int temp;



            int j = a.length - 2;
            while (a[j] > a[j + 1]) {
                j--;
            }



            int k = a.length - 1;
            while (a[j] > a[k]) {
                k--;
            }



            temp = a[k];
            a[k] = a[j];
            a[j] = temp;


            int r = a.length - 1;
            int s = j + 1;

            while (r > s) {
                temp = a[s];
                a[s] = a[r];
                a[r] = temp;
                r--;
                s++;
            }

            numLeft = numLeft.subtract(BigInteger.ONE);
            return a;

        }
    }
}