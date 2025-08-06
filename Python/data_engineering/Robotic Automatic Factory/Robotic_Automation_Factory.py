def sort(width, height, length, mass):
    # Unit Tests
    assert width > 0 , 'Width should be greater than 0'
    assert height > 0, 'Height should be greater than 0'
    assert length > 0, 'Length should be greater than 0'
    assert mass > 0, 'Mass should be greater than 0'
    #
    my_stack =''
    my_tags = []
    my_volume = width * height * length
    # bulky
    if my_volume > 1000000 or width >= 150 or height >= 150 or length >= 150:
        my_tags.append('bulky')
    if mass > 20:
        my_tags.append('heavy')
    if len(my_tags) == 0:
        my_stack = 'STANDARD'
    elif len(my_tags) == 1:
        my_stack = 'SPECIAL'
    elif len(my_tags) == 2:
        my_stack = 'REJECTED'
    return my_stack

#my_test1
print(sort(100, 100, 100, 19))

#my_test2
print(sort(150, 100, 100, 10))

#my_test3
print(sort(10000, 100000, 100000, 1))

#my_test4
print(sort(100, 100, 100, 25))

#my_test5
print(sort(10000, 100000, 100000, 1000))

# Edge Cases

#my_test5
print(sort(0, 100, 100, 100))