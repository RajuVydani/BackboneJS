package com;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.BiFunction;
import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Collectors;

public class Java8 {

public static void main(String[] args) {
Map<Integer, Long> mapGroup = new HashMap<>();
mapGroup.put(1, 1L);
mapGroup.put(2, 2L);
mapGroup.put(3, 3L);
System.out.println("map put returns NULL if its NOT duplicate key :: " + mapGroup.put(3, 3L));
//mapGroup.values().stream().max(Comparator.)
    long max = mapGroup.values().stream().max(Comparator.naturalOrder()).get();
    System.out.println("Max::" + max);
    List<Integer> data = mapGroup.entrySet().stream()
        .filter(e -> { 
        System.out.println("filtering::" + e.getKey());
        return e.getValue() == max;
        })
        //.map(Map.Entry::getKey)
        .map(nums ->
        {
        System.out.println("keys" + nums);
        return nums.getKey();
        }
        )
        .limit(1)
        .collect(Collectors.toList());
    
    System.out.println("Map Features ============================================");
    mapGroup.forEach((k,v) -> System.out.println(k + v));
    mapGroup.entrySet().stream().forEach(entry -> System.out.println("Key::" + entry.getKey() + "::value::" + entry.getValue()));
    
    System.out.println("TEsting limit============================================");
    mapGroup.keySet().stream()
    .limit(1)
    .forEach(System.out :: println);
    
    System.out.println("data-->" + data);
    
    Predicate<String> name = s -> s.equals("one");
    
    System.out.println("Testing...." + name.test("one"));
    
    System.out.println("Testing filter...." + filter(s -> s.equals("testValue")));
    
    List<String> nums = Arrays.asList("one", "one", "two");
    List<String> distinctNums = nums.stream().distinct().collect(Collectors.toList());
    System.out.println("distinctNums" + distinctNums);
    nums.stream().distinct().forEach(System.out::println);
    
    HashSet<String> s = null;
    ArrayList<String> as = new ArrayList<>();
    
    String [] words = new String[10];
    words[1] = "raju";
    System.out.println("arrays::" + words[1]);
    
    System.out.println("Top Salary============================================");
    List<Integer> salaries = Arrays.asList(4000, 2000, 3000, 1000);
    
    int maxSalary = salaries.stream().max(Comparator.naturalOrder()).get();
    System.out.println(maxSalary);

    List<Integer> maxSalaryVal = salaries.stream()
    .filter(sal -> sal >= maxSalary)
    .collect(Collectors.toList());
    System.out.println(maxSalaryVal);
    
    System.out.println("Reduce============================================");
    int sumResult = salaries.stream()
    .reduce(0, (a,b) -> a + b);
    System.out.println(sumResult);
    
    System.out.println("Sorting names =======================================");
    List<String> names = Arrays.asList("one", "two","three","four");
    List<String> sortedNames = names.stream()
    .sorted()
    .collect(Collectors.toList());
    System.out.println(sortedNames);
    
    System.out.println("Using OPTIONAL =======================================");
    boolean numResult = names.stream()
    .filter(number -> number.equals("four"))
    .findAny()
    .isPresent();
    System.out.println(numResult);
    ///////// Optional :: ifPresent()
    names.stream()
    .filter(number -> number.equals("four"))
    .findAny()
    .ifPresent(number -> System.out.println("resulted Number-" + number));
    
    ///////// Optional :: isPresent() / get()
    Optional<String> numOptional = names.stream()
    .filter(number -> number.equalsIgnoreCase("two"))
    .findAny();
    
    if(numOptional.isPresent()) {
    System.out.println("Found one value :: " + numOptional.get());
    } else {
    System.out.println("No numbers found");
    }
    
    ///// Optional :: orElse()
    System.out.println("Optional :: orElse :: " + numOptional.orElse("default"));
    
    
    /////  allMatch
    boolean numOptional2 = names.stream()
.allMatch(number -> number.equalsIgnoreCase("two"));
    
    System.out.println("allmatch :: " + numOptional2);
    
    System.out.println("String Test =======================================");
    String s1 = new String("amazon");
    String s2 = "amazon";
    String s3 = new String("amazon");
    Map<String, Integer> socialData = new HashMap<>();
    socialData.put(s1, 1);
    socialData.put(s2, 2);
    socialData.put(s3, 3);
    System.out.println("socialData::" + socialData);
    System.out.println(s1 == s2);
    
    System.out.println("Predicate=============================================");
    Predicate<String> preTest = word -> word.equalsIgnoreCase("Test");
    System.out.println("Passed Value is :: " + preTest.test("Test"));
    
    System.out.println("Function==============================================");
    Function<Integer, String> functionInt = num -> "one";
    System.out.println("Function returning :: " + functionInt.apply(1));
    
    System.out.println("Consumer==============================================");
    Consumer<List<Integer>> conList = intList -> intList.stream().forEach(num -> System.out.println("Int numbers::" + num));
    conList.accept(Arrays.asList(1,2,3));
    
    System.out.println("Supplier==============================================");
    Supplier<Double> randomValues = () -> Math.random();
    System.out.println("Get random value :: " + randomValues.get());
    
    System.out.println("BiFunction==============================================");
    BiFunction<Integer, Integer, Integer> biData = (a,b) -> a+b;
    System.out.println("BiFunction returning :: " + biData.apply(2,3));
    
}
public static boolean filter(Predicate<String> names) {
boolean result = names.test("one");
return result;
}

}

