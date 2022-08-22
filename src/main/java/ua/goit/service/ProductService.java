package ua.goit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.goit.converter.ProductConverter;
import ua.goit.model.exceptions.ProductNotFoundException;
import ua.goit.model.dao.ProductDao;
import ua.goit.model.dto.ProductDto;
import ua.goit.repository.ProductRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final ProductConverter productConverter;

    @Autowired
    public ProductService(ProductRepository productRepository, ProductConverter productConverter) {
        this.productRepository = productRepository;
        this.productConverter = productConverter;
    }

    public ProductDto findById(UUID id) {
        return productConverter.daoToDto(productRepository.findById(id).orElseThrow(() -> new ProductNotFoundException(String.format("Product with id %s was not found", id))));
    }

    public List<ProductDto> findByName(String name) {
        List<ProductDao> productsDao = productRepository.findByNameList(name);
        return productsDao.stream()
                .map(productConverter::daoToDto)
                .collect(Collectors.toList());
    }

    public List<ProductDto> findAll() {
        List<ProductDao> products = productRepository.findAllProducts();
        return products.stream()
                .map(productConverter::daoToDto)
                .collect(Collectors.toList());
    }

    public void save(ProductDto product) {
        Optional<ProductDao> productDao = productRepository.findByName(product.getName());
        productRepository.save(productConverter.dtoToDao(product));
    }

    public void update(ProductDto product) {
        Optional<ProductDao> productDao = productRepository.findById(product.getId());
        ProductDao old = productDao.get();
        ProductDao productNew = new ProductDao();
        productNew.setId(old.getId());
        productNew.setName(product.getName());
        productNew.setPrice(product.getPrice());
        productNew.setVendor(old.getVendor());
        productRepository.save(productNew);
    }

    public void delete(ProductDto product) {
        Optional<ProductDao> productDao = productRepository.findByName(product.getName());
        productRepository.delete(productDao.get());
    }
}
