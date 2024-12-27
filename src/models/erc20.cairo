use starknet::{ContractAddress};
use dojo_defi_primitives::store::{Store, StoreTrait};
use dojo::world::WorldStorage;
use core::num::traits::Zero;

#[derive(Copy, Drop, Serde, Debug)]
#[dojo::model]
struct ERC20 {
    #[key]
    token_id: felt252,
    #[key]
    owner: ContractAddress,
    balance: u256,
}
