ty++;

if (seed == "fightDamage" && ty == 15)
{
    screenShake(3, 3);
    get_stats(op.party[i3]);
    spawnEEF(oBUI.ePos[oBUI.actions[i3][2] * 2], oBUI.ePos[1 + (oBUI.actions[i3][2] * 2)] - 50, jam2[1], 0, "loopDie,scale2,draw");
    setHand(0, [sNothing, sNothing]);
    setHand(1, [sHand_Hurt, sHand_HurtM]);
    oEnemie.shake = 10;
    oEnemie.armScaleType[1] = 2;
    oEnemie.armExtraScale[1] = -1;
    damageEne(oBUI.actions[i3][2], i3, round(i4 * oBUI.ATKmult * op.custom_partyATK));
    oBUI.TP += round((i4 / oBUI.pDamage[i3]) * 4);
    des(0);
}
