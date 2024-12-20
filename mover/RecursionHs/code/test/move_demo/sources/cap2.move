module move_demo::cap2;
use sui::transfer::{transfer, share_object};

//admin权限
public struct AdminCap has key {
    id: UID,
}

public struct Counter has key {
    id: UID,
    amount: u64,
}

fun init(ctx: &mut TxContext) {
    let admin = AdminCap {
        id: object::new(ctx),
    };
    transfer(admin, ctx.sender());

    let counter = Counter {
        id: object::new(ctx),
        amount: 0,
    };
    share_object(counter);
}

//权限控制
public entry fun use_counter(_: &AdminCap, counter: &mut Counter, _: &mut TxContext) {
    counter.amount = counter.amount + 1;
}


