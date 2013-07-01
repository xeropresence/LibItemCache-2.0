local Lib = LibStub('LibItemCache-1.0')
local AreEqual, IsTrue, Replace = WoWUnit.AreEqual, WoWUnit.IsTrue, WoWUnit.Replace
local Tests = WoWUnit('ItemCache', 'PLAYER_LOGIN', 'GET_ITEM_INFO_RECEIVED')


--[[ Links ]]--

function Tests:ProcessNothing()
	AreEqual(nil, Lib:ProcessLink(nil))
end

function Tests:ProcessItemLink()
	local icon, link, quality = Lib:ProcessLink('49623')

	AreEqual(icon, 'Interface\\Icons\\inv_axe_113')
	IsTrue(link:find('|cffff8000|Hitem:49623:0:0:0:0:0:0:0:%d+:0:0|h%[Shadowmourne%]|h|r'))
	AreEqual(quality, 5)
end

function Tests:ProcessPetLink()
	local results = {Lib:ProcessLink('236:1:2:157:10:10:0')}
	local expected = {
		strupper('Interface\\Icons\\Ability_Mount_Raptor.blp'),
		'|cff1eff00|Hbattlepet:236:1:2:157:10:10:0x0|h[Obsidian Hatchling]|h|r',
		2
	}

	AreEqual(expected, results)
end
