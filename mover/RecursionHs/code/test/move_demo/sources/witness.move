module move_demo::witness;
use std::string;
use std::string::String;
use sui::transfer::transfer;

public struct MyWitness has drop {}

public struct House has key {
    id: UID,
    name: String,
}

public fun create_house(_: MyWitness, ctx: &mut TxContext): House {
    House {
        id: object::new(ctx),
        name: string::utf8(b"My House")
    }
}

//见证者模式，见证资源的诞生,可多次创建 witness
fun init(ctx: &mut TxContext) {
    let my_witness = MyWitness {};
    let house = create_house(my_witness, ctx);
    transfer(house, ctx.sender());

    let my_witness = MyWitness {};
    let house = create_house(my_witness, ctx);
    transfer(house, ctx.sender());


    let my_witness = MyWitness {};
    let house = create_house(my_witness, ctx);
    transfer(house, ctx.sender());
}