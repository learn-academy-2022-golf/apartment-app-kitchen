import React from "react"
import { render, screen } from "@testing-library/react"
import userEvent from "@testing-library/user-event"
import { BrowserRouter } from "react-router-dom"
import Navigation from "./Navigation"

describe("<Navigation />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(
      <BrowserRouter>
        <Navigation />
      </BrowserRouter>,
      div
    )
  })
  it("has clickable links", () => {
    render(
      <BrowserRouter>
        <Navigation />
      </BrowserRouter>
    )
    userEvent.click(screen.getByText("Home"))
    expect(screen.getByText("Home")).toBeInTheDocument()
    userEvent.click(screen.getByText("Sign In"))
    expect(screen.getByText("Sign In")).toBeInTheDocument()
    userEvent.click(screen.getByText("Sign Up"))
    expect(screen.getByText("Sign Up")).toBeInTheDocument()
    userEvent.click(screen.getByText("All apartments"))
    expect(screen.getByText("All apartments")).toBeInTheDocument()
  })
})
