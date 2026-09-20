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
      sha256 "4a5c618baf8991383bf89b52a7fcff0c17f093fec07cfe5c5ec27c73606c1bd3" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "af365f9334976df1b5abd0b8ae22756abfedd2118e1cd8c53ac1d4b43f9cecc4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "2f2397ec1465e4260822ab00b3fb9bc78bb1a9bff564260cbf472158f5a04a15" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.2234+80fe9b2b7.tar.xz"
  version "0.17.0-dev.2234+80fe9b2b7"
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
