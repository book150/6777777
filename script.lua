local player = game.Players.LocalPlayer

local function applyBlackAndWhite(tool)
    task.wait(0.05) -- หน่วงเวลาเล็กน้อยให้โมเดลปืนโหลดเสร็จ
    for _, v in pairs(tool:GetDescendants()) do
        -- ลบภาพลายเดิมทิ้ง
        if v:IsA("Texture") or v:IsA("Decal") then
            v:Destroy()
        end
        -- บังคับเปลี่ยนสีเป็นสีดำ (หรือสลับขาวดำ)
        if v:IsA("BasePart") then
            v.Color = Color3.fromRGB(20, 20, 20) -- ปรับเป็นสีดำเข้ม
            v.Material = Enum.Material.SmoothPlastic
        elseif v:IsA("Trail") or v:IsA("Beam") or v:IsA("ParticleEmitter") then
            v.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)) -- เส้นกระสุนสีขาว
        end
    end
end

-- ดักจับตอนถือปืนในตัวละคร
if player.Character then
    player.Character.ChildAdded:Connect(function(tool)
        if tool:IsA("Tool") then
            applyBlackAndWhite(tool)
        end
    end)
end

player.CharacterAdded:Connect(function(char)
    char.ChildAdded:Connect(function(tool)
        if tool:IsA("Tool") then
            applyBlackAndWhite(tool)
        end
    end)
end)
