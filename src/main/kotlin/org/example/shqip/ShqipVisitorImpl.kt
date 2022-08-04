package org.example.shqip

import org.example.shqip.ShqipParser.*

class ShqipVisitorImpl : ShqipBaseVisitor<String>() {
    override fun visitSay(ctx: SayContext): String {
        return "Say \"${ctx.text().text}\""
    }

    override fun visitAssign(ctx: AssignContext): String {
        return "Assign ${ctx.WORD().text} to ${ctx.NUMBER().text}"
    }

    override fun visitOutput(ctx: OutputContext): String {
        return "Output value of ${ctx.WORD().text}"
    }

    override fun aggregateResult(aggregate: String?, nextResult: String?): String {
        val aggregateText = if (
            aggregate != null &&
            aggregate.isNotBlank() &&
            nextResult != null &&
            nextResult.isNotBlank() &&
            aggregate.last() != '\n'
        ) {
            aggregate + '\n'
        } else {
            aggregate ?: ""
        }

        val nextText = nextResult ?: ""

        return aggregateText + nextText
    }
}
