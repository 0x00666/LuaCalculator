local function isNumber(str)
    return tonumber(str) ~= nil
end

local function getNumber(prompt)
    while true do
        io.write(prompt)
        local input = io.read()
        if isNumber(input) then
            return tonumber(input)
        else
            print("Invalid input. Please enter a valid number.")
        end
    end
end

local function getOperation()
    local validOperations = {'+', '-', '*', '/'}
    while true do
        io.write("Choose an operation: +, -, *, /: ")
        local operation = io.read()
        if operation and #operation == 1 and string.find(table.concat(validOperations), operation, 1, true) then
            return operation
        else
            print("Invalid operation. Please choose from +, -, *, /")
        end
    end
end

local function calculator()
    print('Welcome to the calculator!')
    local num1 = getNumber('First number: ')
    local num2 = getNumber('Second number: ')
    local operation = getOperation()
    
    local result
    if operation == '+' then
        result = num1 + num2
    elseif operation == '-' then
        result = num1 - num2
    elseif operation == '*' then
        result = num1 * num2
    elseif operation == '/' then
        if num2 == 0 then
            print("Error: Division by zero")
            return
        else
            result = num1 / num2
        end
    end
    
    print('Result: ' .. result)
end

calculator()
