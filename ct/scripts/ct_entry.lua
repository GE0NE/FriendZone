

function onInit()
	super.onInit();
	onLinkChanged(); -- call the overload.
end

function onLinkChanged()
	-- If a cohort NPC, then set up the links
	local sClass, sRecord = link.getValue();
	if FriendZone.isCohort(sRecord) then
		if sClass == "npc" then
			linkNPCFields();
		end
		name.setLine(false);
	end

	super.onLinkChanged();
end

function linkNPCFields()
	local nodeChar = link.getTargetDatabaseNode();
	if nodeChar then
		name.setLink(nodeChar.createChild("name", "string"), true);
		senses.setLink(nodeChar.createChild("senses", "string"), true);

		if HpManager then
			hptotal.setLink(nodeChar.createChild("hptotal", "number"));
		else
			hptotal.setLink(nodeChar.createChild("hp", "number"));
		end
		hptemp.setLink(nodeChar.createChild("hptemp", "number"));
		wounds.setLink(nodeChar.createChild("wounds", "number"));
		deathsavesuccess.setLink(nodeChar.createChild("deathsavesuccess", "number"));
		deathsavefail.setLink(nodeChar.createChild("deathsavefail", "number"));

		type.setLink(nodeChar.createChild("race", "string"));
		size.setLink(nodeChar.createChild("size", "string"));
		alignment.setLink(nodeChar.createChild("alignment", "string"));
		
		strength.setLink(nodeChar.createChild("abilities.strength.score", "number"), true);
		dexterity.setLink(nodeChar.createChild("abilities.dexterity.score", "number"), true);
		constitution.setLink(nodeChar.createChild("abilities.constitution.score", "number"), true);
		intelligence.setLink(nodeChar.createChild("abilities.intelligence.score", "number"), true);
		wisdom.setLink(nodeChar.createChild("abilities.wisdom.score", "number"), true);
		charisma.setLink(nodeChar.createChild("abilities.charisma.score", "number"), true);

		init.setLink(nodeChar.createChild("abilities.dexterity.bonus", "number"), true);
		ac.setLink(nodeChar.createChild("ac", "number"), true);
		speed.setLink(nodeChar.createChild("speed", "string"), true);
	end
end