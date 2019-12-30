--=========================--
--       GOLDEN AKMS       --
-- GERMANTACOS, KILLERWOLF --
--=========================--

--=========================--
--        FUNCTIONS        --
--=========================--

--Pretend there are functions here

Hooks:PostHook( WeaponFactoryTweakData, "init", "GoldenAKMSInit", function(self)

--=========================--
--          ARRAYS         --
--=========================--

local all_akmssight = {
	"wpn_fps_upg_o_specter",
	"wpn_fps_upg_o_aimpoint",
	"wpn_fps_upg_o_aimpoint_2",
	"wpn_fps_upg_o_docter",
	"wpn_fps_upg_o_eotech",
	"wpn_fps_upg_o_t1micro",
	"wpn_fps_upg_o_cmore",
	"wpn_fps_upg_o_acog",
	"wpn_fps_upg_o_cs",
	"wpn_fps_upg_o_eotech_xps",
	"wpn_fps_upg_o_reflex",
	"wpn_fps_upg_o_rx01",
	"wpn_fps_upg_o_rx30",
	"wpn_fps_upg_o_spot"
}
local vanilla_akmsight = deep_clone(all_akmssight)
--- Barrel Extensions --
local all_akmsext = {
	"wpn_fps_upg_ns_ass_smg_large",
	"wpn_fps_upg_ns_ass_smg_medium",
	"wpn_fps_upg_ns_ass_smg_small",
	"wpn_fps_upg_ns_ass_smg_firepig",
	"wpn_fps_upg_ns_ass_smg_stubby",
	"wpn_fps_upg_ns_ass_smg_tank",
	"wpn_fps_upg_ns_ass_pbs1",
	"wpn_fps_upg_ass_ns_jprifles",
	"wpn_fps_upg_ass_ns_linear",
	"wpn_fps_upg_ass_ns_surefire",
	"wpn_fps_upg_ass_ns_battle",
	"wpn_fps_ass_ak_stamp_gold_md_akms"
}
local all_akmsfl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}
--- CAFCW aka better later then never also holy shit this actually works ---
if attach_tables then
	for _, md_id in pairs(attach_tables.Barrel_Extensions) do
		if self.parts[md_id] then
			table.insert(all_akmsext, md_id)
		end
	end
	for _, md_id in pairs(attach_tables.Suppressors) do
		if self.parts[md_id] then
			table.insert(all_akmsext, md_id)
		end
	end
	for _, fl_id in pairs(attach_tables.Gadgets) do
		if self.parts[fl_id] then
			table.insert(all_akmsfl, fl_id)
		end
	end
	for _, o_id in pairs(attach_tables.ACOG) do
		if self.parts[o_id] then
			table.insert(all_akmssight, o_id)
		end
	end
	for _, o_id in pairs(attach_tables.Custom) do
		if self.parts[o_id] then
			table.insert(all_akmssight, o_id)
		end
	end
	for _, o_id in pairs(attach_tables.Specter) do
		if self.parts[o_id] then
			table.insert(all_akmssight, o_id)
		end
	end
	--[[
	if attach_tables.Custom_AK then --safety (since that thing doesn't exist in older versions)
		for _, o_id in pairs(attach_tables.Custom_AK) do
			if self.parts[o_id] then
				table.insert(self.parts.wpn_fps_upg_o_ak47_l_scopemount.forbids, o_id)
			end
		end
	end
	--]]
end

--=========================--
--        	ADDS           --
--=========================--
self.parts.wpn_fps_ass_ak_stamp_gold_dc_no.forbids = self.parts.wpn_fps_ass_ak_stamp_gold_dc_no.forbids or {} -- STFU PAYDAY
--- Gun ---
for id, o_id in pairs(all_akmssight) do
	self.wpn_fps_ass_ak_stamp_gold.adds[o_id] = {"wpn_fps_ass_ak_stamp_gold_om_tula"}
	table.insert(self.parts.wpn_fps_ass_ak_stamp_gold_dc_no.forbids, o_id)
end

-- for id, md_id in pairs(all_akmsext) do
	-- self.parts.wpn_fps_ass_ak_stamp_gold_ba_ak104.override[md_id] = {a_obj="a_ns_ak104"}
-- end

--=========================--
--          STANCE         --
--=========================--

--- Vanilla sights ---
for id, o_id in pairs(vanilla_akmsight) do
	if self.parts[o_id].stance_mod.wpn_fps_ass_flint then
		self.parts[o_id].stance_mod.wpn_fps_ass_ak_stamp_gold = deep_clone(self.parts[o_id].stance_mod.wpn_fps_ass_flint)
	else
		log("[AK_Pack] [ERROR] WHO THE FUCK MESSED WITH SIGHT STANCES THIS TIME!? " .. o_id)
	end
end

--=========================--
--      COMPATIBILITY      --
--=========================--

end )