module game::guess_number;
use faucet_coin::alone::ALONE;
use sui::balance;
use sui::balance::Balance;
use sui::coin::Coin;
use sui::object;
use sui::random;
use sui::random::Random;
use sui::transfer;
use sui::transfer::share_object;
use sui::tx_context::TxContext;


public struct Game has key {
    id: UID,
    val: Balance<ALONE>
}

public struct AdminCap has key {
    id: UID,
}

fun init(ctx: &mut TxContext) {
    let gamePoll = Game {
        id: object::new(ctx),
        val: balance::zero()
    };
    //把游戏池共享出去
    share_object(gamePoll);

    let adminCap = AdminCap {
        id: object::new(ctx),
    };
    //权限给发布者
    transfer::transfer(adminCap, ctx.sender());
}

////游戏开始
/// 玩家输入数字
/// 系统生成一个随机数字
/// 玩家猜数字
/// 判断是否猜对了
/// 猜对了奖励给玩家传入的金额,猜错扣除金额
public fun play(gm: &mut Game, rand: &Random, guess_num: u8, in_amount: Coin<ALONE>, ctx: &mut TxContext) {
    //判断投入金额不能大于池中金额的十分之一
    let in_amount_val = in_amount.value();
    let pool_val = gm.val.value();
    assert!(pool_val >= in_amount_val * 10, 0x101);

    //生成随机数字
    let mut gen = random::new_generator(rand,ctx);

    let rand_num = random::generate_u8_in_range(&mut gen,1,10);

    //判断输入的数字是否正确
    if(rand_num == guess_num){
        //奖励金额

    }else {

    }



}