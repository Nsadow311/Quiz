if (SERVER) then
    AddCSLuaFile( "mbr_configurator.lua" )
    SWEP.AutoSwitchTo= false
    SWEP.AutoSwitchFrom= false
end

if ( CLIENT ) then
    SWEP.PrintName            = "Map Button Restrictor Tool"
    SWEP.Slot                = 3
    SWEP.SlotPos            = 1
    SWEP.DrawAmmo= false
    SWEP.DrawCrosshair= true

    surface.CreateFont( "MBRFont", {
    	font = "Arial",
    	size = 25,
    } )

    surface.CreateFont( "MBRFontSmall", {
    	font = "Arial",
    	size = 17,
    } )
end

SWEP.Category = "Map Button Restrictor"


SWEP.Spawnable= true
SWEP.AdminSpawnable= false

SWEP.ViewModel            = "models/weapons/v_357.mdl"
SWEP.WorldModel            = "models/weapons/w_357.mdl"
SWEP.ViewModelFlip        = false

SWEP.Primary.ClipSize      = -1
SWEP.Primary.DefaultClip   = -1
SWEP.Primary.Automatic     = false
SWEP.Primary.Ammo          = "none"
SWEP.Secondary.ClipSize    = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic   = false
SWEP.Secondary.Ammo        = "none"

SWEP.Instructions = "Look at a button and press primary fire\n\nPrimary Fire - Prints the button ID (If it didn't work a error sound will be played)"


local ShootSoundFire = Sound( "Airboat.FireGunHeavy" )
local ShootSoundFail = Sound( "WallHealth.Deny" )

function SWEP:PrimaryAttack()
    local tr = self.Owner:GetEyeTrace()

    if tr.Entity:GetClass() == "func_button" or tr.Entity:GetClass() == "func_rot_button" then

        self.Owner:ChatPrint("Button ID: " .. tr.Entity:MapCreationID())

        self:EmitSound( ShootSoundFire )

    else

        self.Owner:ChatPrint("This is not a button.")

        self:EmitSound( ShootSoundFail )

    end

    return true

end

function SWEP:SecondaryAttack()

    return true

end

function SWEP:ShouldDropOnDie()
    return false
end
