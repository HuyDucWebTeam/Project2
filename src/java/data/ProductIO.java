package data;

import business.Product;
import java.io.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductIO {

    public static List<Product> productList;
    
    public static void viewProduct(String file) throws IOException{
        productList = new ArrayList<>();
        BufferedReader br = new BufferedReader(new FileReader(file));
        String line = br.readLine();
        while(line != null){
            System.out.println(line);
            String[] products = line.split("\\|");
            Product p = new Product(products[0], products[1], Float.valueOf(products[2]));
            System.out.println(p);
            productList.add(p);
            line = br.readLine();
        }
        br.close();
    }

    public static void addProduct(Product product, String file) throws IOException {
        FileWriter fileWriter = new FileWriter(new File(file), true);
        PrintWriter printWriter = new PrintWriter(fileWriter);

        productList.add(product);
        printWriter.println(product.toString());

        printWriter.close();
    }

    public static void editProduct(Product product, String file) throws IOException {
        FileWriter fileWriter = new FileWriter(new File(file), true);
        PrintWriter printWriter = new PrintWriter(fileWriter);

        for (Product p : productList) {
            if (product.getCode().equals(p.getCode())) {
                p = product;
            }
        }

        fileWriter.flush();

        for (Product p : productList) {
            printWriter.println(p.toString());
        }
        printWriter.close();
    }
}
