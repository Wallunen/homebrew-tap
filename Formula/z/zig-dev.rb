class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260919-121241"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "47b5c217f2def45468946bcb8f1a55f65c775933b80b5a1d1c6c565afb2d172d"
    sha256 cellar: :any_skip_relocation, sequoia:      "6a2034d5c3c9317b624ddfc717e7ce8d74d696986277fa9d9ecc88d647c288c4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "62835566177b5eef5f7712aa7360ff32cae1c4c906fb6441c278765d3643a4a8"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "ab349382776df44c6fcd76278c8c750a765000bdcc5c2edc0f0fd52557b8b69f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "43a882ac4704d30685928d3c4f3c7d62b4ce286a875df88bc0b206931bd0b0d1" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "7ba127e73adeafd25aee6a16cc6008486c93ea0fcec5bff9d7c6b035785b22c3" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2228+955228b68.tar.xz"
  version "0.17.0-dev.2228+955228b68"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
