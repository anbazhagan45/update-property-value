# Write Properties 

This is a GitHub action to write values to `.properties` files.

**Note:** It will work for all file-types that follow the `key=value` pattern.

## Inputs

### `source_path`

**Required** The path to properties/template file to copy as property file.

### `properties`

**Required** The property or properties you want to write. It accepts array of properties. ex, key1, key2, key3

### `values`

**Required** The value of the given property or properties, in the same order. It accepts array of values. ex, value1, value2, value3

### `replace_token`

**Optional** The property values to replace special char. example, if the secrets contains EQUALTO and if you would like to replace as = then pass EQUALTO:= this will replace EQUALTO occurances in values and replace with =

## Example usage

    - name: Write value to Properties-file
      uses: anbazhagan45/write-property-file@1.0.0
      with:
        source_path: './src/main/resources/application.properties'
        property: |
          key1,key2,key3
        value: |
          value1,value2,value3
        replace_token: |
          token1,token2

# License
The scripts and documentation in this project are released under the [MIT License](LICENSE)
