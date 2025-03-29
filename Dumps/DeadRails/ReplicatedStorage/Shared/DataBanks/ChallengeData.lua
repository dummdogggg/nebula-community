--[[
    Script: ReplicatedStorage.Shared.DataBanks.ChallengeData
    Type: ModuleScript
    Decompiled with Wave using Nebula Decompiler
--]]

return {
    escape = {
        Title = "Escape", 
        Description = "Travel 80km and successfully lower the bridge.", 
        ProgressNeeded = 1, 
        Rewards = {
            Bonds = 5, 
            Stars = 1
        }
    }, 
    unicorn = {
        Title = "Tame a Unicorn", 
        Description = "Put a saddle on a wild unicorn or find one already tamed", 
        ProgressNeeded = 1, 
        Rewards = {
            Bonds = 5, 
            Stars = 1
        }
    }, 
    bounty = {
        Title = "Bounty Hunter", 
        Description = "Kill 5 outlaws and turn in their bounties at a sheriffs office", 
        ProgressNeeded = 5, 
        Rewards = {
            Bonds = 5, 
            Stars = 1
        }
    }, 
    outlaw = {
        Title = "New Sheriff in Town", 
        Description = "Kill 50 outlaws in one game", 
        ProgressNeeded = 50, 
        Rewards = {
            Bonds = 15, 
            Stars = 3
        }
    }, 
    zombie = {
        Title = "Zombie Hunter", 
        Description = "Kill 200 zombies in one game", 
        ProgressNeeded = 200, 
        Rewards = {
            Bonds = 15, 
            Stars = 3
        }
    }, 
    werewolf = {
        Title = "Werewolf Hunter", 
        Description = "Kill 50 werewolves in one game", 
        ProgressNeeded = 50, 
        Rewards = {
            Bonds = 15, 
            Stars = 3
        }
    }, 
    not_die = {
        Title = "Unkillable", 
        Description = "Complete the game without having any player die", 
        ProgressNeeded = 1, 
        Rewards = {
            Bonds = 30, 
            Stars = 9
        }
    }, 
    not_kill = {
        Title = "Pacifist", 
        Description = "Complete the game without any player killing an enemy (Safezone turrets don't count)", 
        ProgressNeeded = 1, 
        Rewards = {
            Bonds = 30, 
            Stars = 9
        }
    }, 
    no_train = {
        Title = "Pony Express", 
        Description = "Complete the game without any player using the train", 
        ProgressNeeded = 1, 
        Rewards = {
            Bonds = 30, 
            Stars = 9
        }
    }
};