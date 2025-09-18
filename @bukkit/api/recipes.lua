local String = import("java.lang.String")
local Material = import("org.bukkit.Material")
local ItemStack = import("org.bukkit.inventory.ItemStack")
local ShapedRecipe = import("org.bukkit.inventory.ShapedRecipe")
local RecipeChoice_MaterialChoice = import("org.bukkit.inventory.RecipeChoice$MaterialChoice")
local RecipeChoice_ExactChoice = import("org.bukkit.inventory.RecipeChoice$ExactChoice")


local this = {}

---@private
---@type java.Map<string, java.Object>?
this.recipes = nil

---@private
function this.init()
    this.recipes = java.map()

    events.onStopping(function()
        if this.recipes.isEmpty() then return end
        local itr = bukkit.Bukkit.recipeIterator()
        while itr.hasNext() do
            local i = itr.next()
            if i.getKey().getNamespace() == "scripting" then
                itr.remove()
            end
        end
    end)
end

---Create a shaped recipe to craft the specified ItemStack. The constructor merely determines the result and type; to set the actual recipe, you'll need to call the appropriate method
---@param id string
---@param result bukkit.ItemStack
---@return java.Object recipe org.bukkit.inventory.ShapedRecipe
---@nodiscard
function this.new(id, result)
    return ShapedRecipe(
        bukkit.namespacedKey(id),
        result
    )
end

---Set the shape of this recipe to the specified rows. Each character represents a different<br>
---ingredient; excluding space characters, which must be empty, exactly what each character<br>
---represents is set separately. The first row supplied corresponds with the upper most part of the<br>
---recipe on the workbench e. g. if all three rows are supplies the first string represents the top row<br>
---on the workbench.<br>
---<br>
---**Example:**
---```lua
---bukkit.recipes.shape(
---    recipe,
---    " A ",
---    "B B",
---    " C "
---)
---```
---@param recipe java.Object org.bukkit.inventory.ShapedRecipe
---@param ... string the rows of the recipe (up to 3)
---@return java.Object recipe org.bukkit.inventory.ShapedRecipe
function this.shape(recipe, ...)
    recipe.shape(makeArray(String, #arrayOf(...), ...)) -- TODO
    return recipe
end

---Sets the material that a character in the recipe shape refers to.
---@param recipe java.Object org.bukkit.inventory.ShapedRecipe
---@param key string char the character that represents the ingredient in the shape
---@param ingredient bukkit.Material|java.Object org.bukkit.material.MaterialData|org.bukkit.inventory.RecipeChoice
---@return java.Object recipe
function this.ingredient(recipe, key, ingredient)
    recipe.setIngredient(key, ingredient)
    return recipe
end

---Represents a choice of multiple matching Materials.
---@param ... bukkit.MaterialItem* Materials to test for.
---@return java.Object recipeChoice org.bukkit.inventory.RecipeChoice
function this.materialChoice(...)
    return RecipeChoice_MaterialChoice(makeArray(Material, #arrayOf(...), ...)) -- TODO
end

---Represents a choice that will be valid only if one of the stacks is exactly matched (aside from<br>
---stack size).<br>
---**Only valid for shaped recipes**
---@param ... bukkit.ItemStack item-stacks to test for
---@return java.Object recipeChoice org.bukkit.inventory.RecipeChoice
function this.exactChoice(...)
    return RecipeChoice_ExactChoice(makeArray(ItemStack, #arrayOf(...), ...)) -- TODO
end

---@param recipe java.Object org.bukkit.inventory.ShapedRecipe
---@return boolean success
function this.register(recipe)
    if this.recipes == nil then
        this.init()
    end

    local id = recipe.getKey().getKey()
    this.unregister(id)
    this.recipes.put(id, recipe)
    return bukkit.Bukkit.addRecipe(recipe)
end

---@param id string
---@return boolean removed
function this.unregister(id)
    if this.recipes == nil then return false end

    local key = bukkit.namespacedKey(id)
    this.recipes.remove(id)
    if bukkit.Bukkit.getRecipe(key) == nil then return false end
    return bukkit.Bukkit.removeRecipe(key)
end

bukkit.recipes = this
