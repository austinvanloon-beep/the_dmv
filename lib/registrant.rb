# If no value is provided for permit, it should default to false. -
# We should also be able to change a permit from false to true after-
# a Registrant has earned their permit. There is no age limit to when-
# someone can earn their permit.

class Registrant
        attr_accessor :name, :age, :permit, :license_data

        def initialize(name, age, permit, license_data = {written: false, license: false, renewed: false})

            @name = name
            @age = age
            @permit = permit
            @license_data = license_data
        end
end