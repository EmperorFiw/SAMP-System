//Author: EMPEROR
//��¹�� EMPEROR
#include 	<YSI_Coding\y_hooks>

#if !defined COLOR_GREEN         	0x00FF00FF
    #define     COLOR_GREEN         	0x00FF00FF
#endif

CMD:ooc(playerid, params[])
{
	if (playerData[playerid][pVip] == 0 && playerData[playerid][pAdmin] == 0)
	{
		if (!OOC)
		    return SendClientMessage(playerid, COLOR_RED, "[System] {FFFFFF}OOC �١�Դ��ҹ����");

		if (playerData[playerid][pOOCSpam] > 0)
		    return SendClientMessageEx(playerid, COLOR_RED, "[System] {FFFFFF}��к���ͧ�ѹ Spam ��س����ա %d �Թҷ�", playerData[playerid][pOOCSpam]);
	}
	if (playerData[playerid][pFaction] == -1)
	{
	    if (playerData[playerid][pVip] > 0)
		{
			OOCVipNoneFaction(playerid, params, true);
		}
		else
		{
			OOCVipNoneFaction(playerid, params, false);
		}
	}
	else
	{
	    if (playerData[playerid][pVip] > 0)
		{
			OOCVipFactionCheck(playerid, params, true);
		}
		else
		{
			OOCVipFactionCheck(playerid, params, false);
		}
	}
	playerData[playerid][pOOCSpam] = 20;
	return 1;
}
alias:ooc("o")

strToNum(const str[]) 
{
    new num = 0, i = 0;
    while (str[i] != '\0') 
	{
        if (str[i] >= '0' && str[i] <= '9') 
		{
            num = num * 10 + (str[i] - '0');
        }
        i++;
    }
    return num;
}

OOCVipNoneFaction(playerid, const params[], bool:faction)
{
	new bool:found = false;
	if (faction)
	{
		new length = strlen(params);
		new nums[4], userid, Pos = strfind(params, "@", true); 

		if (strfind(params, "@", true) != -1) 
		{
			new count = 0;  
			for (new x = strfind(params, "@", true); x <= length && x <= strfind(params, "@", true) + 3; x++) 
			{
				if (params[x] >= '0' && params[x] <= '9') 
				{

					nums[count] = params[x];
					count++;
				}
			}
			nums[count] = '\0';
			userid = strToNum(nums);
			foreach (new i : Player)
			{
				if (userid == i && userid != playerid)
				{
					new string[64], stringp[560];
					format(stringp, sizeof(stringp), "%s", params);
					format(string, sizeof(string), " %s ", GetPlayerNameEx(userid));
					strins(stringp, string, Pos+count+1);
					strdel(stringp, Pos, Pos+count+1);
					SendClientMessageToAllEx(COLOR_WHITE, "#{00FFFF}VIP{FFFFFF} [��ЪҪ�] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), stringp);
					SendClientMessageEx(userid, COLOR_GREEN, "�դ����ѧ����Ƕ֧�س");
					found = true;
					break;
				}
			}
			if (!found)
			{
				SendClientMessageToAllEx(COLOR_WHITE, "#{00FFFF}VIP{FFFFFF} [��ЪҪ�] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), params);
			}
		}
		else
		{
			SendClientMessageToAllEx(COLOR_WHITE, "[��ЪҪ�] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), params);
		}
	}
	else
	{
		new length = strlen(params);
		new nums[4], userid, Pos = strfind(params, "@", true); 

		if (strfind(params, "@", true) != -1) 
		{
			new count = 0;  
			for (new x = strfind(params, "@", true); x <= length && x <= strfind(params, "@", true) + 3; x++) 
			{
				if (params[x] >= '0' && params[x] <= '9') 
				{

					nums[count] = params[x];
					count++;
				}
			}
			nums[count] = '\0';
			userid = strToNum(nums);
			foreach (new i : Player)
			{
				if (userid == i && userid != playerid)
				{
					new string[64], stringp[560];
					format(stringp, sizeof(stringp), "%s", params);
					format(string, sizeof(string), " %s ", GetPlayerNameEx(userid));
					strins(stringp, string, Pos+count+1);
					strdel(stringp, Pos, Pos+count+1);
					SendClientMessageToAllEx(COLOR_WHITE, "[��ЪҪ�] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), stringp);
					SendClientMessageEx(userid, COLOR_GREEN, "�դ����ѧ����Ƕ֧�س");
					found = true;
					break;
				}
			}
			if (!found)
			{
				SendClientMessageToAllEx(COLOR_WHITE, "[��ЪҪ�] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), params);
			}
		}
		else
		{
			SendClientMessageToAllEx(COLOR_WHITE, "[��ЪҪ�] {FFA84D}(ID:%d){FFFFFF} %s: %s", playerid, GetPlayerNameEx(playerid), params);
		}
	}

	return 1;
}

OOCVipFactionCheck(playerid, const params[], bool:vip)
{
	new bool:found = false;
	if (vip)
	{
		new length = strlen(params);
		new nums[4], userid, Pos = strfind(params, "@", true); 

		if (strfind(params, "@", true) != -1) 
		{
			new count = 0;  
			for (new x = strfind(params, "@", true); x <= length && x <= strfind(params, "@", true) + 3; x++) 
			{
				if (params[x] >= '0' && params[x] <= '9') 
				{

					nums[count] = params[x];
					count++;
				}
			}
			nums[count] = '\0';
			userid = strToNum(nums);
			foreach (new i : Player)
			{
				if (userid == i && userid != playerid)
				{
					new string[64], stringp[560];
					format(stringp, sizeof(stringp), "%s", params);
					format(string, sizeof(string), " %s ", GetPlayerNameEx(userid));
					strins(stringp, string, Pos+count+1);
					strdel(stringp, Pos, Pos+count+1);
					SendClientMessageToAllEx(COLOR_WHITE, "#{00FFFF}VIP{FFFFFF} {%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), stringp);
					SendClientMessageEx(userid, COLOR_GREEN, "�դ����ѧ����Ƕ֧�س");
					found = true;
					break;
				}
			}
			if (!found)
			{
				SendClientMessageToAllEx(COLOR_WHITE, "#{00FFFF}VIP{FFFFFF} {%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), params);
			}
		}
		else
		{
			SendClientMessageToAllEx(COLOR_WHITE, "#{00FFFF}VIP{FFFFFF} {%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), params);
		}
	}
	else
	{
		new length = strlen(params);
		new nums[4], userid, Pos = strfind(params, "@", true); 

		if (strfind(params, "@", true) != -1) 
		{
			new count = 0;  
			for (new x = strfind(params, "@", true); x <= length && x <= strfind(params, "@", true) + 3; x++) 
			{
				if (params[x] >= '0' && params[x] <= '9') 
				{

					nums[count] = params[x];
					count++;
				}
			}
			nums[count] = '\0';
			userid = strToNum(nums);
			foreach (new i : Player)
			{
				if (userid == i && userid != playerid)
				{
					new string[64], stringp[560];
					format(stringp, sizeof(stringp), "%s", params);
					format(string, sizeof(string), " %s ", GetPlayerNameEx(userid));
					strins(stringp, string, Pos+count+1);
					strdel(stringp, Pos, Pos+count+1);
					SendClientMessageToAllEx(COLOR_WHITE, "{%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), stringp);
					SendClientMessageEx(userid, COLOR_GREEN, "�դ����ѧ����Ƕ֧�س");
					found = true;
					break;
				}
			}
			if (!found)
			{
				SendClientMessageToAllEx(COLOR_WHITE, "{%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), params);
			}
		}
		else
		{
			SendClientMessageToAllEx(COLOR_WHITE, "{%06x}[%s] {FFA84D}(ID:%d){FFFFFF} %s: %s", factionData[playerData[playerid][pFaction]][factionColor] >>> 8, Faction_GetName(playerid), playerid, GetPlayerNameEx(playerid), params);
		}
	}
	return 1;
}
